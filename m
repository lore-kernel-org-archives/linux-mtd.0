From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 17 Mar 2003 11:00:51 +0100
Subject: How use FTP on serial port(COM1)?
In-Reply-To: <20030317074641.GA9492@wohnheim.fh-wedel.de>
References: <OE32DCOTSt39LktrLEz00001e01@hotmail.com> <20030317074641.GA9492@wohnheim.fh-wedel.de>
Message-ID: <20030317100051.GB3930@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 17 March 2003 08:46:41 +0100, J?rn Engel wrote:
> On Mon, 17 March 2003 10:50:09 +0800, guo_zhenglin wrote:
> > 
> > 3)I had config linux kernel :
> >     CONFIG_PPP=y
> >     CONFIG_PPP_ASYNC=y
> >     CONFIG_PPPOE=y
> 
> PPPOE is unnecessary. Maybe some more options are needed, will check
> that at work...

We have the following options set for one of our boxes. MULTILINK,
DEFLATE and BSDCOMP shouldn't be necessary, though.

CONFIG_PPP=y
CONFIG_PPP_MULTILINK=y
CONFIG_PPP_ASYNC=y
# CONFIG_PPP_SYNC_TTY is not set
CONFIG_PPP_DEFLATE=y
CONFIG_PPP_BSDCOMP=y

J?rn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
