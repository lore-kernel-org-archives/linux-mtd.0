Received: from lancelot.crf.canon.fr ([194.2.158.66])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Kdvr-0000Zl-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 11:42:55 +0100
Received: (from smap@localhost)
	by lancelot.crf.canon.fr (8.9.2/8.9.2) id MAA14013
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 12:44:56 +0200 (MET DST)
Message-ID: <3B4D7FA4.9040805@crf.canon.fr>
Date: Thu, 12 Jul 2001 12:44:52 +0200
From: "VALETTE Eric" <valette@crf.canon.fr>
Reply-To: valette@crf.canon.fr
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Moving from 2.2.18 + M-system proprietray code to 2.4.6 => does not work
References: <3B4D6B4E.2040303@crf.canon.fr> <7474.994930069@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:

> 
> valette@crf.canon.fr said:
> 
>>NB : /dev/discs/disc1# ls -l
>>total 0
>>brw-------    1 root     root      93,   0 Jan  1  1970 disc
>>brw-------    1 root     root      93,   1 Jan  1  1970 part1
>>
> 
>>But I can not mount the filesystem. The filesystem is valid as it
>>works with the 2.2.18 kernel...
>>
> 
> Does it work without devfs?

I did not even tested it as I need devfs for USB devices hotplug... 
Besides, I had hoped to not be hurt by major/minor like I had been in 
the past...

What are the right major minor for DOC 2000? I found values in mtd.h and 
other in major.h.


-- 
    __
   /  `                          Eric Valette - Canon CRF
  /--   __  o _.                 Canon Development Europe Team Leader
(___, / (_(_(__                 Rue de la touche lambert
                                 35517 Cesson-Sevigne  Cedex
                                 FRANCE
Tel: +33 (0)2 99 87 68 91       Fax: +33 (0)2 99 84 11 30
E-mail: valette@crf.canon.fr    http://www.crf.canon.fr
