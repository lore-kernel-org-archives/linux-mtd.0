Received: from eu1sys200aog104.obsmtp.com ([207.126.144.117])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PuIhs-00011v-Mv
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2011 06:05:13 +0000
Message-ID: <4D6C8C83.2010608@st.com>
Date: Tue, 1 Mar 2011 11:34:51 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH V2 resend] fsmc-nand: Add fsmc_nand_set_plat_data in
	drivers/mtd/nand/fsmc_nand.c
References: <8b8879499520ac641f7e38ac0e40182eb7f32f85.1298866118.git.viresh.kumar@st.com>	
	<1298897478.2809.12.camel@localhost> <4D6C6D79.80502@st.com>
	<1298958661.2314.11.camel@koala>
In-Reply-To: <1298958661.2314.11.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	Linus WALLEIJ <linus.walleij@stericsson.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/01/2011 11:21 AM, Artem Bityutskiy wrote:
> On Tue, 2011-03-01 at 09:22 +0530, viresh kumar wrote:
>> > This is what i explained in the commit message also. We don't declare device
>> > structures in board files, as this information is machine dependent, so this is present
>> > in common machine file to all boards.
>> > Now we have to set platform data. This can be be done in board_init() routine in
>> > the board specific file.
>> >  But then this routine will contain below mentioned code,
>> > and so will not look clean enough.
> Not sure why it will be not clean enough. Just add it to your board
> files, this is few lines of code after all.
> 
> if (partitions) {
> 	plat_data->partitions = partitions;
> 	plat_data->nr_partitions = nr_partitions;
> }
> plat_data->options = options;
> plat_data->width = width;
> 
> How many board files you have?
> 
>> >  so we thought of creating this function which can
>> > simply be reused by all board files.
> OK, but I think you should try to find some other place instead of
> putting it to the driver. What is the fundamental reason to put this
> code to the driver? Why it belongs to the driver?

This patch was on setting fsmc_nand_platform_data from board file.
So i thought this might be the best place for doing so. As this can be
reused by others too.

Probably this patch can be dropped now, as i have changed the approach a bit.
device structure will be in machine.c file. plat data will be defined in boards
file and i will introduce following routine, which can be used by board files.
I have already sent this patch to linux-arm-kernel list.


---------------

[RFC] device.h: add device_set_platdata routine

device.h supports device_get_platdata but doesn't support device_set_platdata.
This routine is required by platforms in which device structure is declared
in a machine specific file and platform data comes from board specific file.

This will be used by SPEAr patches sent in separate patch series.

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
 include/linux/device.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 1bf5cf0..6ce0f20 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -576,6 +576,11 @@ static inline void *dev_get_platdata(const struct device *dev)
 	return dev->platform_data;
 }
 
+static inline void dev_set_platdata(struct device *dev, void *platdata)
+{
+	dev->platform_data = platdata;
+}
+
 /*
  * Manual binding of a device to driver. See drivers/base/bus.c
  * for information on use.

-- 
viresh
