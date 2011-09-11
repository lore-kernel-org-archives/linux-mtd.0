Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2jxC-0006ph-B0
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:20:10 +0000
Received: by pzk4 with SMTP id 4so6650696pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:20:09 -0700 (PDT)
Subject: Re: Security enhancement for UBIFS with secure erase feature
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stelling Carsten <Carsten.Stelling@goerlitz.com>
Date: Sun, 11 Sep 2011 16:22:36 +0300
In-Reply-To: <02855DE82B1CA94A9115CCD637A1325643CD9EC4A3@goemail-server.goerlitz.int>
References: <02855DE82B1CA94A9115CCD637A1325643CD9EC4A3@goemail-server.goerlitz.int>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315747360.18731.57.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-09-08 at 16:35 +0200, Stelling Carsten wrote:
> < Are there any plans for such a security enhancement in UBIFS?
> 
> Hello Atlant,
> 
> you're right. Writing zeroes is not applicable to all kinds of flash technology.
> 
> Are there any plans to support privacy in UBIFS?
> 
> In my opinion privacy should be guaranteed by the file system, so that any
> application can rely on its security features.
> 
> There're other solutions, e.g. to encrypt the content of each file with a unique
> key stored in the metadata area of that particular file. Although this solution
> needs to secure erase the key associated with the deleted file too.
> I see, that might be a real dilemma.
> 
> Are there any suggestions?

Well, it is possible to implement secure erase, but it will be very slow
- you'll need to garbage collect all eraseblocks which contain the old
file, including all the obsolete portions of that file which might still
be on the flash media.

So basically, to secure delete a file, you'd need to scan whole flash to
find all its old (obsolete) fragments.

VS plans - no, there are no plans, UBIFS does not enjoy a lot of
developer's. You are welcome with patches, though!

-- 
Best Regards,
Artem Bityutskiy
