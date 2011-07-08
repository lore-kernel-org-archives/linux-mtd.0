Received: from nm4.bullet.mail.sp2.yahoo.com ([98.139.91.74])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QfArR-0005Rl-6Q
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 13:12:50 +0000
Message-ID: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
Date: Fri, 8 Jul 2011 06:12:45 -0700 (PDT)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: UBIFS Corruption
To: MTD Mailing List <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

We're using ubifs in an embedded uclinux system (based on ADI Blackfin's BF524). 
 Been working great for us for a while.  Kernel is 2.6.34.7 (uclinux).

However, we just saw 2 corruptions within the past 48h that we can't explain. 
 We've been doing the same basic operation (in terms of flashing/reading/writing 
images) for quite some time, and have reflashed our units many times (over 
thousands of different hardware units).

Device #1 failure:
* Device was running out of a partition mounted to /home (a 93MB partition from 
a 128MB NAND device)
* Our app was running normally and locked up (not sure why).  Our code may have 
been updating a sqlite database located in that partition
* When we power cycled, the partition had the corruption issue noted.

Device #1 boot log:
UBI device number 1, total 750 LEBs (96768000 bytes, 92.3 MiB), available 0 LEBs 
(0 bytes), LEB size 129024 bytes (126.0 KiB) 
[ 5.228000] UBIFS: recovery needed 
[ 5.320000] UBIFS error (pid 363): ubifs_scanned_corruption: corruption at LEB 
172:45056 
[ 5.348000] UBIFS error (pid 363): ubifs_recover_leb: LEB 172 scanning failed 
mount: mounting ubi1:home on /home failed: Structure needs cleaning 

Device #2 failure:
* Device was running normally.
* We upgraded our application (which involved updating executables on that 
partition)
* After the successful upgrade, we powered the unit down and stored 
* Days later, powered up the device and the above invalid CRC as noted

Device #2 boot log:
UBI device number 1, total 750 LEBs (96768000 bytes, 92.3 MiB), available 0 LEBs 
(0 bytes), LEB size 129024 bytes (126.0 KiB) 
[ 5.488000] UBIFS: recovery needed 
[ 5.492000] UBIFS error (pid 365): check_lpt_crc: invalid crc in LPT node: crc 
a0 calc 9013
mount: mounting ubi1:home on /home failed: Invalid argument


So, what is concerning is the sheer randomness of these failures.  In neither 
case were we doing anything new (vs. standard operations we have been performing 
for over a year on many devices per day).  Additionally, there's no additional 
logging available, because this *never* happens.  We have never needed (after we 
got UBIFS working) to have the debug output enabled in the driver.  To make 
matters worse, if you ask me to reproduce this, I don't know any way of doing 
it.  We have automated tests that run continually, and they never see these 
issues.

One corruption could be written off as a fluke, but 2 happening within 48h is 
very unusual.  

Can anybody give me any insight into this?  

TIA
RP
