Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbKbC-00008S-Qc
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 10:44:14 -0400
Message-ID: <40D300A4.1020700@inf.u-szeged.hu>
Date: Fri, 18 Jun 2004 16:48:04 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	"Artem B. Bityuckiy" <abityuckiy@yandex.ru>, linux-mtd@lists.infradead.org
References: <40CD76C2.1080007@inf.u-szeged.hu> <40CDACF2.5040502@yandex.ru>	
	<34463.160.114.55.5.1087282322.squirrel@webmail.inf.u-szeged.hu>
	<1087431940.4530.14.camel@localhost.localdomain>
In-Reply-To: <1087431940.4530.14.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: (NAND) JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>I wasn't going to do it on umount. I was going to do it at the end of
>each eraseblock. When we've almost filled an eraseblock we write a
>summary to the end of it, containing all the information which we would
>otherwise have to read from it during mount.
>
>That's basically a list of the { inode#, physical_offset, length } for
>each node in the eraseblock, and something about nlink. Note that
>there's a lot of redundancy in the offsets and lengths so we can
>contrive a storage method which is fairly efficient. 
>
>Then at mount we look first at the _end_ of each eraseblock for such a
>summary. If it exists, we read in the state from it. If not, we scan
>that particular eraseblock the old way.
>  
>
Artem and our idea are very similar.

But I think your one is better. It's a little bit slower in mount time 
but much easier to implement (and also much more clean).

I think we'll start to implement it.

Regards,
Ferenc
