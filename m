Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D77H6-000753-Et
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 02:31:05 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 58F6A2F017
	for <linux-mtd@lists.infradead.org>;
	Fri,  4 Mar 2005 08:31:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 47E8A117F7
	for <linux-mtd@lists.infradead.org>;
	Fri,  4 Mar 2005 08:31:03 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 9337C116F7
	for <linux-mtd@lists.infradead.org>;
	Fri,  4 Mar 2005 08:31:02 +0100 (CET)
Message-ID: <42280EB6.4030007@imc-berlin.de>
Date: Fri, 04 Mar 2005 08:31:02 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD List <linux-mtd@lists.infradead.org>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>	
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>	
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>	
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>	
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>	
	<1109847630.16158.22.camel@hades.cambridge.redhat.com>	
	<4226F51A.7070603@imc-berlin.de>	
	<Pine.LNX.4.62.0503031146070.15953@localhost.localdomain>
	<1109874008.29792.92.camel@baythorne.infradead.org>
In-Reply-To: <1109874008.29792.92.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [RFD] Move 2.4 code out from CVS head
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Thu, 2005-03-03 at 11:48 -0500, Nicolas Pitre wrote:
> 
>>>Does that mean that there will be _no_ " maintainence only mode" for
>>>2.4?
>>
>>Depends if _you_ or someone else decides to volunteer for the task.
>>do you?  I don't.
> 
> 
> I _am_ maintaining JFFS2 in the 2.4 kernel, even to the extent of
> backporting the __wait_on_freeing_inode() stuff from 2.6 to fix the
> problems with simultaneous read_inode() and clear_inode(). But I'm not
> adding new features, so NAND flash isn't supported in 2.4.

How about SUMMARY patch then? ;-)
Seriously, since JFFS3 will not get into the 2.4 stuff Ferenc's SUMMARY patch 
would be nice!

And BTW: How do I get the 2.4 branch from CVS?

--
Steven
