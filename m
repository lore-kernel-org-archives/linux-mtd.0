Date: Fri, 14 Jan 2005 16:44:11 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Pihet Jean-jpih01 <jean.pihet@motorola.com>
In-Reply-To: <A124D5FDCB07D911920E00110A9AE3833A036E@zfr17exm01.ea.mot.com>
Message-ID: <Pine.LNX.4.58.0501141641260.17331@phoenix.infradead.org>
References: <A124D5FDCB07D911920E00110A9AE3833A036E@zfr17exm01.ea.mot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2/3 NAND performance figures
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 Jan 2005, Pihet Jean-jpih01 wrote:

> Hi all !
> 
> I would like to evaluate the JFFS2/3 NAND flash performance. Are there measurements available for the following cases: read, write, erase, GC ?
> 
> Looking on the MTD website and Google was not helpful =8-
Don't know.
Just hint: the iget() operation may be quite slow for big files in JFFS2 
due to its design, so consider benchmarking it either (open file/directory 
or stat() it).

> 
> Regards,
> Jean.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
