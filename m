Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eARw5-0002mz-Lw
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 02:42:26 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vA32dong123514
 for <linux-mtd@lists.infradead.org>; Thu, 2 Nov 2017 22:42:00 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e0de16qk6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 22:41:59 -0400
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Fri, 3 Nov 2017 02:41:57 -0000
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, sjitindarsingh@gmail.com
Subject: [PATCH v5 07/10] powernv/opal-sensor: remove not needed lock
Date: Fri,  3 Nov 2017 13:41:43 +1100
In-Reply-To: <20171103024146.17086-1-cyrilbur@gmail.com>
References: <20171103024146.17086-1-cyrilbur@gmail.com>
Message-Id: <20171103024146.17086-8-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Stewart Smith <stewart@linux.vnet.ibm.com>

Parallel sensor reads could run out of async tokens due to
opal_get_sensor_data grabbing tokens but then doing the sensor
read behind a mutex, essentially serializing the (possibly
asynchronous and relatively slow) sensor read.

It turns out that the mutex isn't needed at all, not only
should the OPAL interface allow concurrent reads, the implementation
is certainly safe for that, and if any sensor we were reading
from somewhere isn't, doing the mutual exclusion in the kernel
is the wrong place to do it, OPAL should be doing it for the kernel.

So, remove the mutex.

Additionally, we shouldn't be printing out an error when we don't
get a token as the only way this should happen is if we've been
interrupted in down_interruptible() on the semaphore.

Reported-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-sensor.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-sensor.c b/arch/powerpc/platforms/powernv/opal-sensor.c
index aa267f120033..0a7074bb91dc 100644
--- a/arch/powerpc/platforms/powernv/opal-sensor.c
+++ b/arch/powerpc/platforms/powernv/opal-sensor.c
@@ -19,13 +19,10 @@
  */
 
 #include <linux/delay.h>
-#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <asm/opal.h>
 #include <asm/machdep.h>
 
-static DEFINE_MUTEX(opal_sensor_mutex);
-
 /*
  * This will return sensor information to driver based on the requested sensor
  * handle. A handle is an opaque id for the powernv, read by the driver from the
@@ -38,13 +35,9 @@ int opal_get_sensor_data(u32 sensor_hndl, u32 *sensor_data)
 	__be32 data;
 
 	token = opal_async_get_token_interruptible();
-	if (token < 0) {
-		pr_err("%s: Couldn't get the token, returning\n", __func__);
-		ret = token;
-		goto out;
-	}
+	if (token < 0)
+		return token;
 
-	mutex_lock(&opal_sensor_mutex);
 	ret = opal_sensor_read(sensor_hndl, token, &data);
 	switch (ret) {
 	case OPAL_ASYNC_COMPLETION:
@@ -52,7 +45,7 @@ int opal_get_sensor_data(u32 sensor_hndl, u32 *sensor_data)
 		if (ret) {
 			pr_err("%s: Failed to wait for the async response, %d\n",
 			       __func__, ret);
-			goto out_token;
+			goto out;
 		}
 
 		ret = opal_error_code(opal_get_async_rc(msg));
@@ -73,10 +66,8 @@ int opal_get_sensor_data(u32 sensor_hndl, u32 *sensor_data)
 		break;
 	}
 
-out_token:
-	mutex_unlock(&opal_sensor_mutex);
-	opal_async_release_token(token);
 out:
+	opal_async_release_token(token);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(opal_get_sensor_data);
-- 
2.15.0
