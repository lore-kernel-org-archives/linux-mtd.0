Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbl5-0001dz-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:07:55 +0100
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: 64-bit support..what happened? 
Date: Wed, 4 Sep 2002 08:06:55 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFOEKKDLAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <2249.1031151115@redhat.com>
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

> > I believe that there are 3 files under map that include the conditional
> > compile and none of them include the proper header file. Perhaps this
> > just indicates that the conditional should be moved to another file or
> > change to use the autoconfig defines?
>
> I'm inclined to suggest that it should be removed from all three offending
> map files and a new example for 64-bit operation be added;
> physmap64.c. And
> you should only be able to enable physmap64.c in the config if you've
> enabled 64-bit operation -- so it shouldn't need any conditionals at all.
>
> Does that sound sane?

Sounds good and just a Makefile change. Do you want me to do that?
