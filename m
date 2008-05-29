Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1c9f-0004cN-9R
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 07:02:31 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3080809wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 May 2008 00:02:29 -0700 (PDT)
Message-ID: <bae050c10805290002gb294d4yf5a62a4331225dbc@mail.gmail.com>
Date: Thu, 29 May 2008 15:02:29 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: mkfs.ubifs, ubinize, ubiupdatevol request!
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
       First of all, please accept my deeply apologize to Artem
Bityutskiy. I'm sorry for my bad question expression and bad attitude.
No matter what, I should be thankful for all your replies to me.
That's all my bad, so sorry!
       I still need your guilde and help, please!

       # mkfs.vfat /dev/ubiblock0
       the cp file speed is 800kb/s -1.3Mb/s. on target board. but
when connect with PC.
       # modprobe g_file_storage file=/dev/ubiblock0
      cp files speed too slow about 200kb/s, But after use windows
fast FAT32 format program, the cp speed up to 800kb/s -1.3Mb/s.

       I don't know what's the detail differences between mkfs.vfat
and windows format program.  For me, the speed problem is really hard
to find. Is there anyone who can give me a hint?

       What I do know is mkfs.vfat will write LEB from 0-N
continuesly, but windows format program will write LEB from 0-N plus
the last LEB.
       If I use windows format program to avoid the speed problem,
then the new problem comes out.
       when I dump VFAT volume to a file, there have ummapped LEBs in
between Cause the windows format program will write the last LEB. But
I can't dump the ummaped LEBs to files due to the dump file size
limitation. So I have to teach ubiupdatevol and ubinize to .....   Oh
please, that's really hard things for me.

To mkfs.ubifs:
       How about give each Mapped LEB an header( long long lnum )? So the
image file content structure looks like:
-------------------------------------------------------------------
long long lnum |  LEB |  long long lnum | LEB | ...........................
-------------------------------------------------------------------

To ubinize and ubiupdatvol, the implement logic maybe easier.

But, I have not enought knowlege to change mkfs.ubifs work that way.
So, will you please help?

Thanks a lot!
Apologize again!

-- 
Best wishes,
Nancy
