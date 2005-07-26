Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxLrG-0002YQ-1x
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 05:36:24 -0400
Date: Tue, 26 Jul 2005 11:36:24 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20050726093624.GE15903@wohnheim.fh-wedel.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
	<20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru> <42E5E816.5090500@inf.u-szeged.hu>
	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu> <42E5F474.7020003@imc-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42E5F474.7020003@imc-berlin.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 July 2005 10:29:40 +0200, Steven Scholz wrote:
> To: linux-mtd@lists.infradead.org

Please keep everyone on the Cc: list.

> Is there any chance to extend the code so that EBS will use the first mount 
> to generate a summary instead having the need of a user space tool to 
> create an JFFS2 image with EBS?

That's a lot of code for something inherently inefficient.  EBS should
create summaries for *new* blocks that are written, sure.  But if you
try to GC every single block without summary, your mount time will be
well beyond it would have been without EBS.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
