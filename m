Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JCOfS-00014v-O9
	for linux-mtd@lists.infradead.org; Wed, 09 Jan 2008 00:19:45 +0000
Date: Tue, 8 Jan 2008 16:19:31 -0800
From: David Brown <davidb@davidb.org>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH] Claim maintainership for block2mtd and update email
	addresses
Message-ID: <20080109001931.GA16426@old.davidb.org>
References: <20080106135600.GB3120@lazybastard.org>
	<20080107152300.2ed7cddb.akpm@linux-foundation.org>
	<20080108010656.GA10627@lazybastard.org>
	<Pine.LNX.4.64.0801090016570.10908@axis700.grange>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0801090016570.10908@axis700.grange>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 09, 2008 at 12:23:24AM +0100, Guennadi Liakhovetski wrote:

>On Tue, 8 Jan 2008, Jörn Engel wrote:
>
>> I'm happy if people spend effort and make unicode work.  Until then I'll
>> semi-officially change my name to "Joern" and keep collecting unusual
>> specimens.
>
>Just wondering - nothing personal at all. What's the official plan for 
>this - do we want (when utf8 works) to use utf8 codes for symbols only for 
>languages mostly based on ASCII, like iso-8859-15, or for all?

UTF-8 already works fine in git.  There is some support in recent versions
to allow commit messages and users to be specified in other encodings.

I think the issue here is with mailers modifying the encoding of data in
message files.

My reply header should be to Jörn, with a proper 'o' with two dots over it.
By default, my mailer wants to encode the message in iso-8859-1.  If I add
a single unicode character, say '‣', then the whole message will get
encoded in UTF-8.

UTF-8 has the advantage of supporting nearly all character sets.  The extra
space needed isn't really an issue for usernames or for comment messages.

Dave
