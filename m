Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMm9-0000Wj-VI
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:17:06 +0000
Received: by eyh6 with SMTP id 6so1127929eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 08:17:04 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: add the fixup function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1304694820-32474-1-git-send-email-dedekind1@gmail.com>
References: <1304694820-32474-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 18:13:33 +0300
Message-ID: <1304694813.7222.75.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 18:13 +0300, Artem Bityutskiy wrote:
> From: Matthew L. Creech <mlcreech@gmail.com>
> 
> This patch adds the 'ubifs_fixup_free_space()' function which scans all LEBs in
> the filesystem for those that are in-use but have one or more empty pages, then
> re-maps the LEBs in order to erase the empty portions.  Afterward it removes
> the "space_fixup" flag from the UBIFS superblock.
> 
> Artem: amended the commit message, massage the patch, fix few minor things
> there.
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is your patch N2 but with many of my changes and amendments. I've
added the code which should take care of the log LEBs - completely
untested. I've amended comments - I did not like the word "remap" you
used - better use "fixup" for that thing, I did not like the word "page"
you used - better use min. I/O unit, unless we are speaking specifically
about NAND. I've removed some comments and added some new, massaged the
code, changed those other things which I wrote about (not touching the
other SB bits, kfree, etc).

Also, we use "UBIFS:" (capital letters) prefix for patches. Could you
please take a look and if you do not have strong disagreements then
amend _this_ version of patch, test it and probably fix, and then send
the whole series again. Note, patch N1 is already in my tree, so unless
you need to change it - you do not have to send it.

Thanks! Sorry for messy replies, I'm (as always) busy and trying to do
as much as I can during the little time I have :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
