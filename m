Date: Tue, 21 Dec 2004 14:45:38 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041216175331.GA6788@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0412211445240.23254@phoenix.infradead.org>
References: <Pine.LNX.4.58.0412161420360.8020@phoenix.infradead.org>
	<JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
	<20041216175331.GA6788@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

> Principle of crc:
> A crc is nothing but the remainder of an integer division.  That
> simple.
>
>
> Example crc4:
> crc4(data) = data%13;
Hmm, is it really correct? CRC is ramainder, but in mod 2 arithmetic. I 
consulted http://www.cs.waikato.ac.nz/~312/crc.txt

And if so, your algorithm
u32 crc24(void *m, size_t len)
{
        u32 ret=0;
        char *s=m;
        size_t i;
        for (i=0; i<len; i++) {
                ret <<= 8;
                ret += s[i];
                ret %/ 0xfffffd
        }
        return ret;
}

doesn't look like something which is called CRC...

Do I misunderstand something?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
