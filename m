Received: from mail.brecis.com ([64.168.228.202])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbwM-0001gw-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:19:35 +0100
Date: Wed, 4 Sep 2002 10:17:06 -0500
From: Steve Wahl <swahl@brecis.com>
To: Jasmine Strong <jasmine@hex.linuxgrrls.org>
Cc: Allen Curtis <acurtis@onz.com>, David Woodhouse <dwmw2@infradead.org>,
        John Hall <John.Hall@optionexist.co.uk>,
        "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4
Message-ID: <20020904101706.D23398@brecis.com>
References: <NCBBIINEHIPFGJPLBEIFAEKJDLAA.acurtis@onz.com> <Pine.LNX.4.33.0209041551460.22265-100000@hex.linuxgrrls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0209041551460.22265-100000@hex.linuxgrrls.org>; from jasmine@hex.linuxgrrls.org on Wed, Sep 04, 2002 at 03:54:03PM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, Sep 04, 2002 at 03:54:03PM +0100, Jasmine Strong wrote:
> 
> 
> On Wed, 4 Sep 2002, Allen Curtis wrote:
> 
> > How about we add 1 byte which contains up to 8 bit fields?
> 
> Adding a byte will destroy the alignment.  you'd have to add a whole word.
> 
> We could have a #define to set whether we use the lsb of the address (on
> aligned architectures) or an extra byte (on non-aligned architectures,
> which won't care about the structure not being an exact multiple of words
> anyway).

My $0.02 is: 

The #define is a good suggestion.  

But the assumption that using the lsb of the pointer will only break
on archetectures that don't care about alignment may be a bad one.

I haven't looked at the code (shame on me...), but I thought I heard
the word "tree" mentioned. :-) If this data structure is being used
for speed, I have to ask if the extra masking instructions are a good
trade off for the memory saved?

--> Steve
