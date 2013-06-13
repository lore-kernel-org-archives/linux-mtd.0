Received: from mx08.lb01.inode.at ([62.99.145.8] helo=mx.inode.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un7bD-0004X2-HY
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 13:30:00 +0000
Received: from [83.64.51.210] (port=7857 helo=gateway1.hale)
 by smartmx-08.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.69) (envelope-from <helmut.raiger@hale.at>)
 id 1Un7ap-0000Vy-OP
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 15:29:35 +0200
Received: from mail.hale (mail.hale [192.168.100.5])
 by gateway1.hale (8.13.8/8.13.7) with ESMTP id r5DDTJiV014922
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 15:29:19 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.hale (Postfix) with ESMTP id A79FB6656C4
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 15:29:24 +0200 (CEST)
Received: from mail.hale ([127.0.0.1])
 by localhost (mail.hale [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d2JA0eYccvAu for <linux-mtd@lists.infradead.org>;
 Thu, 13 Jun 2013 15:29:24 +0200 (CEST)
Received: from mail.hale (mail.hale [192.168.100.5])
 by mail.hale (Postfix) with ESMTP id 33FBD6656C1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 15:29:24 +0200 (CEST)
Date: Thu, 13 Jun 2013 15:29:24 +0200 (CEST)
From: Raiger Helmut <helmut.raiger@hale.at>
To: linux-mtd@lists.infradead.org
Message-ID: <1142745477.330790.1371130164128.JavaMail.root@mail.hale>
In-Reply-To: <20130613135031.59037201@parrot.com>
Subject: Re: UBIFS: How to reserve space to be used right before power cut
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> ----- Original Message -----
> From: "Matthieu CASTET" <matthieu.castet@parrot.com>
> To: "Helmut Raiger" <helmut.raiger@hale.at>
> Cc: linux-mtd@lists.infradead.org
> Sent: Thursday, June 13, 2013 1:50:31 PM
> Subject: Re: UBIFS: How to reserve space to be used right before power cut
>
> Hi,
>
> Why do you do this in ubifs ?
>
> If you do it in ubi/mtd this will be a lot's of easier.
>
> Matthieu

I wasn't aware of an userspace interface for ubi/mtd, but just found out
about gluebi. Is this the path you suggest?

Could you please elaborate a bit more on this, I'm still unsure if
this will meet our timing constraints (background operation of ubi?)

Helmut

--
Scanned by MailScanner.
