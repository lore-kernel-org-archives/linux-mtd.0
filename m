Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sOn2-0000j3-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 13:53:04 +0100
Message-ID: <3AE6C937.7C174E07@crossnet.co.jp>
Date: Wed, 25 Apr 2001 21:55:19 +0900
From: Masami Komiya <mkomiya@crossnet.co.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: (No Subject)
References: <3AE6C0DC.CFA18C77@crossnet.co.jp>  <3AE69E21.CDCF90A1@crossnet.co.jp> <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> <3311.988123586@redhat.com> <25105.988194419@redhat.com> <4501.988201568@redhat.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> mkomiya@crossnet.co.jp said:
> >  I was misunderstanding about the definitions in cfi_probe_chip().
> > Attached patch is for cfi_cmdset_0002.c applied simon's patch.
> 
> Looks like you mean it's for cfi_cmdset_0002.c _without_ Simon's patch. It
> looks fine to me - I'll give it a day or so for people to object before I
> apply it though :)

Last patch needs Simon's patch. If you does not want to change
CFI_DEVICETYPE_X8 to cfi->device_type, please use following.

(twice 0x2aa is equal to 0x554 :-)

*** cfi_probe.c.org	Wed Apr 18 17:26:35 2001
--- cfi_probe.c	Wed Apr 25 21:39:23 2001
***************
*** 202,209 ****
  		cfi->addr_unlock2=0x2aa; 
  		break;
  	case CFI_DEVICETYPE_X16:
! 		cfi->addr_unlock1=0xaaa; 
! 		cfi->addr_unlock2=0x555; 
  		break;
  	case CFI_DEVICETYPE_X32:
  		cfi->addr_unlock1=0x1555; 
--- 202,214 ----
  		cfi->addr_unlock2=0x2aa; 
  		break;
  	case CFI_DEVICETYPE_X16:
! 		cfi->addr_unlock1=0xaaa;
! 		if (map->buswidth == 2) {
! 			cfi->addr_unlock2=0x554; 
! 		}
! 		else {
! 			cfi->addr_unlock2=0x555; 
! 		}
  		break;
  	case CFI_DEVICETYPE_X32:
  		cfi->addr_unlock1=0x1555;


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
