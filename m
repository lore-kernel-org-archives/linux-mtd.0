Received: from 205-158-62-37.outblaze.com ([205.158.62.37] helo=ws1-9.us4.outblaze.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XjSQ-0001S1-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 15:19:10 +0100
Message-ID: <20020725141838.53920.qmail@mail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Mike Schumi" <schumi@techie.com>
To: dwmw2@infradead.org, "Mike Schumi" <schumi@techie.com>
Cc: linux-mtd@lists.infradead.org
Date: Thu, 25 Jul 2002 09:18:38 -0500
Subject: Re: jffs2_do_reserve_space
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David,
 
  (not ftp avail, sorry) I'll email you the dump for the 2 consecutive boots (If anyone else wants  them let me know). Everytime I run the cardmgr  and plug in the card, the next boot crashes on a write. And every boot  after that too.  I can bypass this problem by making /var a ramfs mount. (because cardmgr is writing to /var something). So it looks like write to a jffs2 /var  is whats causing the problem, because when /var is mounted a ramfs and jffs2 is readonly, all is well. But solving this problem would be nice:)
  Your help is appreciated...

  Sequence on commands I ran:
  <boot>
  cat /proc/kmsg
  echo 9 > /proc/sys/kernel/printk
  df
  cardmgr
  <Plugged in the ATA CF card >
  df
  <Reboot>
  cat /proc/kmsg
  echo 9 > /proc/sys/kernel/printk
  df
  ls > text    (<- crash)  

----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 25 Jul 2002 07:40:39 +0100
To: "Mike Schumi" <schumi@techie.com>
Subject: Re: jffs2_do_reserve_space 


> 
> schumi@techie.com said:
> >   I've looked for a solution to this problem, but haven't seen it
> > posted anywhere, although some ppl have had it before.  
> 
> Please could you provide a complete debug log, from mount onwards. I need to 
> see how the data structure got into that state. It'll be large -- maybe 
> bzip2 it and tick it up for FTP somewhere?
> 
> Also do 'df' as soon as it's happened.
> 
> 
> --
> dwmw2
> 
> 
> 

-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

Get 4 DVDs for $.49 cents! plus shipping & processing. Click to join. 
http://oas-central.realmedia.com/RealMedia/ads/click_lx.ads/mail.com/columbiahouse/1112745096/x09/ExactAdv/ColumbiaHouse_IO473_7.19_8.19/blank.gif/636632633232383133383736634333430
