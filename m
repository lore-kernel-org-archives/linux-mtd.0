Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Ql02n-0002oU-5T
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2011 14:52:38 +0000
Received: by iyn15 with SMTP id 15so4458396iyn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Jul 2011 07:52:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F87D23B7E1F84E4AB52E4FA4A55F85DC026DADA5@tpamail.elutions.com>
References: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
	<F87D23B7E1F84E4AB52E4FA4A55F85DC026DADA5@tpamail.elutions.com>
Date: Sun, 24 Jul 2011 16:52:30 +0200
Message-ID: <CACTFLANxErq=-9tZBJDOrF6J7SXf3zRttnOA6cCkoQmVoBLV0w@mail.gmail.com>
Subject: Re: Regression in handling of unsafe UBI shutdown
From: Daniel Mack <zonque@gmail.com>
To: Mike Hench <mhench@elutions.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sven Neumann <s.neumann@raumfeld.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 20, 2011 at 1:45 PM, Mike Hench <mhench@elutions.com> wrote:
>> UBIFS: recovery needed
>> Error reading superblock on volume 'ubi:RootFS'!
>> UBIFS not mounted, use ubifs mount to mount volume first!
>> Wrong Image Format for bootm command
>> ERROR: can't get kernel image!
>
>
> Be nice to know what error.
> FWIW:
> a) I do not see this. I have very limited experience with 3.0-rc7 though
> so maybe I should not say anything :-)
>
> b) sometimes UBIFS decides to do recovery in u-boot, sometimes not.
> it seems to depend on the type of content in the journal.
> Lots of deleted files seem to trigger u-boot to perform a recovery for
> instance.
> I was running out of memory In u-boot while replaying the journal
> at one point with an older kernel. This produced the same top level
> error.

Thank you very much vor mentioning this, as it totally pointed me in
the right direction. Whatever really caused it, we ended up with
larger journal produced by newer kernels in comparison to older ones,
and U-Boot indeed ran out memory when trying to access the FS later.
Increasing the amount of available memory in U-Boot fixes the problem
for us.

Sorry for scaring you, but it looked like a major regression in the
first place. And thanks again to everyone for helping sort this out.


Daniel
