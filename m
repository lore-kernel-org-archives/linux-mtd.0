Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZUnN-0006AN-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 09:22:45 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZUnM-0006AH-00
	for mtd@infradead.org; Mon, 27 Mar 2000 09:22:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10003242351500.1291-101000@tammy.signum.se> 
References: <Pine.LNX.4.10.10003242351500.1291-101000@tammy.signum.se> 
To: mtd@infradead.org
Cc: Alexander Larsson <alex@cendio.se>,
    Bjorn Wesen <bjorn.wesen@axis.com>,
    SeokKuon Kwon <kwonsk@mutech.co.kr>,
    Scott Anderson <sanders@mvista.com>
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 27 Mar 2000 09:23:38 +0100
Message-ID: <5747.954145418@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Forgive me for reposting private mails to the list, but it seems that some 
introductions are in order....

alex@cendio.se said (re Axis' JFFS):
>  This filesystem is really needed since the ftl layer has patent
> problem and this one seems totally free. 

sanders@mvista.com said:
>  From what little I understand about the M-systems' patent, it
> basically patented the idea of using an array to do the translation
> and I would guess that Axis' work would violate that.

kwonsk@mutech.co.kr said:
> If i could not use FTL layer on the direct flash chip under GPL, then
> what mtd Layer (FFS from MS?) should i choose without license
> problems?

I'm not really sure about the patent issues - I'm just glad I live in the Free
World (for now). It's probably best discussed on the list than in private mail 
with my clueless self.

(To subscribe to the list, send "subscribe mtd" in the body of a mail to 
majordomo@infradead.org)


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
