Received: from port61.vestas.dk ([195.41.59.61] helo=cotas2.cotas.vestas.dom)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195S1V-0001C2-I4
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 16:07:01 +0100
From: Esben Nielsen <esn@cotas.dk>
To: "Holger Schurig" <h.schurig@mn-logistik.de>,
 <linux-mtd@lists.infradead.org>
Date: Tue, 15 Apr 2003 17:06:36 +0200
References: <200304151051.34585.h.schurig@mn-logistik.de>
In-Reply-To: <200304151051.34585.h.schurig@mn-logistik.de>
MIME-Version: 1.0
Message-Id: <200304151706.36445.esn@cotas.dk>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Database on JFFS2?
Reply-To: esn@cotas.dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, but are those writes syncronices with actual flash writes such I am sure 
that a write is _physically_ complete when fsync() returns? 
They certainly ought to be or many applications would get in trouble with 
corrupt data at a sudden reboot.

Let us assume it is so. Then I need to tweak sqlite to only force an fsync() 
when the JFFS2 layer is ready to commit anyway to avoid too many writes.
Any idea of how to do that?

Esben

On Tuesday 15 April 2003 10:51, Holger Schurig wrote:
> > into that now.  It has a log system. The most optimal would be if the
> > database could be tuned not to write too often and on other hand when it
> > does it is flush to flash immediately to prevent datacorruption.
>
> That is simple to find out. sqllite is so small, you surely could add some
> printf() statements at the right place to find out when it writes date.
>
> Hey, even "strace -efile" may help you. "man strace" is your friend.
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
