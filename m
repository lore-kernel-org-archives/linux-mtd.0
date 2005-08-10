Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2nrI-0003AI-Pa
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 06:30:59 -0400
Message-ID: <42F9D758.9070104@imc-berlin.de>
Date: Wed, 10 Aug 2005 12:30:48 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <42F9BA34.6090008@prie.de>
	<20050810083828.GA16583@wohnheim.fh-wedel.de>
	<42F9BF5F.7060603@prie.de> <42F9C28D.4070206@yandex.ru>
	<42F9C4AF.6030505@prie.de> <42F9C612.2050301@yandex.ru>
	<42F9C980.7030301@prie.de>
	<20050810100557.GA18149@wohnheim.fh-wedel.de>
	<42F9D377.8090700@imc-berlin.de>
	<20050810102854.GB18149@wohnheim.fh-wedel.de>
In-Reply-To: <20050810102854.GB18149@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Bernhard Priewasser <bernhard@prie.de>, linux-mtd@lists.infradead.org
Subject: Re: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:

> On Wed, 10 August 2005 12:14:15 +0200, Steven Scholz wrote:
> 
>>>The name "JFFS3" ist confusing...
>>>
>>>JFFS has a strictly log-structured design.  JFFS2 is still
>>>log-structured,
>>
>>log-structured == journaling ?
> 
> 
> Not really, but opinions differ on this subject.
> 
> A journal is basically the same as a log.  But a journaled fs has the
> journal/log _in addition_ to some other data layout.  A log-structured
> fs _only_ has the journal/log.
> 
> JFFS2 is log-structured and the name is a bug, imo.  My personal
> implementation of a JFFS2 successor is called LOGFS, btw.  It makes
> perfect sence, since LOGFS is just as log-structured as JFFS2 is
> journaled - not at all. ;)

;-)

However, I hope the new name will be easier pronouncable! ;-)

--
Steven
