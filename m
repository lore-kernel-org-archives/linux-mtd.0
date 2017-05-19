Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWh3-0005ss-0O
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:01 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 rtc-linux@googlegroups.com
Subject: [PATCH 12/29] rtc.txt: standardize document format
Date: Thu, 18 May 2017 22:25:56 -0300
Message-Id: <de62f8091ae4e7d2af980e6cd79071348622cdc8.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- adjust identation of the titles;
- mark a table as such;
- don't capitalize chapter names.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/rtc.txt | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/Documentation/rtc.txt b/Documentation/rtc.txt
index ddc366026e00..47feb4414b7e 100644
--- a/Documentation/rtc.txt
+++ b/Documentation/rtc.txt
@@ -1,6 +1,6 @@
-
-	Real Time Clock (RTC) Drivers for Linux
-	=======================================
+=======================================
+Real Time Clock (RTC) Drivers for Linux
+=======================================
 
 When Linux developers talk about a "Real Time Clock", they usually mean
 something that tracks wall clock time and is battery backed so that it
@@ -32,8 +32,8 @@ only issue an alarm up to 24 hours in the future, other hardware may
 be able to schedule one any time in the upcoming century.
 
 
-	Old PC/AT-Compatible driver:  /dev/rtc
-	--------------------------------------
+Old PC/AT-Compatible driver:  /dev/rtc
+--------------------------------------
 
 All PCs (even Alpha machines) have a Real Time Clock built into them.
 Usually they are built into the chipset of the computer, but some may
@@ -105,8 +105,8 @@ that will be using this driver.  See the code at the end of this document.
 (The original /dev/rtc driver was written by Paul Gortmaker.)
 
 
-	New portable "RTC Class" drivers:  /dev/rtcN
-	--------------------------------------------
+New portable "RTC Class" drivers:  /dev/rtcN
+--------------------------------------------
 
 Because Linux supports many non-ACPI and non-PC platforms, some of which
 have more than one RTC style clock, it needed a more portable solution
@@ -136,35 +136,37 @@ a high functionality RTC is integrated into the SOC.  That system might read
 the system clock from the discrete RTC, but use the integrated one for all
 other tasks, because of its greater functionality.
 
-SYSFS INTERFACE
+SYSFS interface
 ---------------
 
 The sysfs interface under /sys/class/rtc/rtcN provides access to various
 rtc attributes without requiring the use of ioctls. All dates and times
 are in the RTC's timezone, rather than in system time.
 
-date:  	   	 RTC-provided date
-hctosys:   	 1 if the RTC provided the system time at boot via the
+================ ==============================================================
+date  	   	 RTC-provided date
+hctosys   	 1 if the RTC provided the system time at boot via the
 		 CONFIG_RTC_HCTOSYS kernel option, 0 otherwise
-max_user_freq:	 The maximum interrupt rate an unprivileged user may request
+max_user_freq	 The maximum interrupt rate an unprivileged user may request
 		 from this RTC.
-name:		 The name of the RTC corresponding to this sysfs directory
-since_epoch:	 The number of seconds since the epoch according to the RTC
-time:		 RTC-provided time
-wakealarm:	 The time at which the clock will generate a system wakeup
+name		 The name of the RTC corresponding to this sysfs directory
+since_epoch	 The number of seconds since the epoch according to the RTC
+time		 RTC-provided time
+wakealarm	 The time at which the clock will generate a system wakeup
 		 event. This is a one shot wakeup event, so must be reset
-		 after wake if a daily wakeup is required. Format is seconds since
-		 the epoch by default, or if there's a leading +, seconds in the
-		 future, or if there is a leading +=, seconds ahead of the current
-		 alarm.
-offset:		 The amount which the rtc clock has been adjusted in firmware.
+		 after wake if a daily wakeup is required. Format is seconds
+		 since the epoch by default, or if there's a leading +, seconds
+		 in the future, or if there is a leading +=, seconds ahead of
+		 the current alarm.
+offset		 The amount which the rtc clock has been adjusted in firmware.
 		 Visible only if the driver supports clock offset adjustment.
 		 The unit is parts per billion, i.e. The number of clock ticks
 		 which are added to or removed from the rtc's base clock per
 		 billion ticks. A positive value makes a day pass more slowly,
 		 longer, and a negative value makes a day pass more quickly.
+================ ==============================================================
 
-IOCTL INTERFACE
+IOCTL interface
 ---------------
 
 The ioctl() calls supported by /dev/rtc are also supported by the RTC class
-- 
2.9.4
