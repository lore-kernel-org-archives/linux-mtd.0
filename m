Date: Fri, 21 Jan 2005 13:13:14 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050121124403.GA9931@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501211312570.20298@phoenix.infradead.org>
References: <20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106233518.2903.15.camel@sauron.oktetlabs.ru>
	<20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
	<1106243853.7940.15.camel@sauron.oktetlabs.ru>
	<20050121124403.GA9931@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jrn Engel wrote:
> Basically, there are two kinds of file attributes.  First the old,
> well-known and well-defined ones from original unix, see stat(2).
> Those are part of the inode for any unix-style filesystem.  Plus any
> arbitraty other attributes, that people may wish for.  Since those are
> neither well-known nor well-defined, we shouldn't statically allocate
> space for them in the inode.
> 
> But I fear that you were talking about something completely different.
> In that case, the "xattr" put me on the wrong track.
I'm aware of xattr basics. Ok, let's put out of mind this for now :-)

> Still not convinced, but I'm too lazy to argue over four bytes.
I think this is not so important now.

I would like create TeX file and put this "JFFS3 checkusm stuff" there. 
This will be "JFFS3 design issues file". It will be accessible via CVS and 
people may  edit it, contributing new ideas.

More questions which I would like to discuss are:

* JFFS3 memory consumption
* JFFS3 & locking

May be:

* mmap "shared" issue
* xattr design

may be other.

After discussing we may put summarized info to that document. Possibly 
this document will be accessible via web as pdf.

Comments?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
