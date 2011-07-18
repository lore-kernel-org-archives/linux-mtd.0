Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qim7z-0005UA-Qi
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2011 11:36:48 +0000
Received: by iyn15 with SMTP id 15so3378064iyn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jul 2011 04:36:46 -0700 (PDT)
Subject: Re: UBIFS Corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Mon, 18 Jul 2011 14:38:05 +0300
In-Reply-To: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310989090.20738.46.camel@sauron>
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-07-08 at 06:12 -0700, Reginald Perrin wrote:
> Hi folks,
> 
> We're using ubifs in an embedded uclinux system (based on ADI Blackfin's BF524). 
>  Been working great for us for a while.  Kernel is 2.6.34.7 (uclinux).
> 
> However, we just saw 2 corruptions within the past 48h that we can't explain. 
>  We've been doing the same basic operation (in terms of flashing/reading/writing 
> images) for quite some time, and have reflashed our units many times (over 
> thousands of different hardware units).
> 
> Device #1 failure:
> * Device was running out of a partition mounted to /home (a 93MB partition from 
> a 128MB NAND device)
> * Our app was running normally and locked up (not sure why).  Our code may have 
> been updating a sqlite database located in that partition
> * When we power cycled, the partition had the corruption issue noted.
> 
> Device #1 boot log:
> UBI device number 1, total 750 LEBs (96768000 bytes, 92.3 MiB), available 0 LEBs 
> (0 bytes), LEB size 129024 bytes (126.0 KiB) 
> [ 5.228000] UBIFS: recovery needed 
> [ 5.320000] UBIFS error (pid 363): ubifs_scanned_corruption: corruption at LEB 
> 172:45056 
> [ 5.348000] UBIFS error (pid 363): ubifs_recover_leb: LEB 172 scanning failed 
> mount: mounting ubi1:home on /home failed: Structure needs cleaning 

While this is very typical symptom which might mean many things,

> Device #2 failure:
> * Device was running normally.
> * We upgraded our application (which involved updating executables on that 
> partition)
> * After the successful upgrade, we powered the unit down and stored 
> * Days later, powered up the device and the above invalid CRC as noted
> 
> Device #2 boot log:
> UBI device number 1, total 750 LEBs (96768000 bytes, 92.3 MiB), available 0 LEBs 
> (0 bytes), LEB size 129024 bytes (126.0 KiB) 
> [ 5.488000] UBIFS: recovery needed 
> [ 5.492000] UBIFS error (pid 365): check_lpt_crc: invalid crc in LPT node: crc 
> a0 calc 9013
> mount: mounting ubi1:home on /home failed: Invalid argument

I do not remember this one. This may be an UBIFS bug of course, but
quite possible this is just flash corruption or memory corruption (e.g.,
some driver corrupts memory and makes UBIFS write incorrect information
to the flash).

-- 
Best Regards,
Artem Bityutskiy
