Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjVIG-0002Zz-0G
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 11:50:29 +0000
Received: by pzk1 with SMTP id 1so242927pzk.16
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 04:50:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F87D23B7E1F84E4AB52E4FA4A55F85DC026DADA5@tpamail.elutions.com>
References: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
	<F87D23B7E1F84E4AB52E4FA4A55F85DC026DADA5@tpamail.elutions.com>
Date: Wed, 20 Jul 2011 13:50:21 +0200
Message-ID: <CACTFLAOsEZksaUXrN9KVeXHnSxtY-h8XWiYDyn_OxTLxmeWjeg@mail.gmail.com>
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

Hi Mike,

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

Thanks for this information. It's good to know there are similar
setups used by other people. Are you an an ARM as well?

Did you try to cut the power from your device in the middle of full
operation? If would help a lot if you could try this.


> b) sometimes UBIFS decides to do recovery in u-boot, sometimes not.
> it seems to depend on the type of content in the journal.
> Lots of deleted files seem to trigger u-boot to perform a recovery for
> instance.

And my fear is that the possible types of content changed in UBIFS in
a way that the kernel itself would be able to deal with it, but legacy
code (in U-Boot and in our case) wouldn't. That would explain what I'm
seeing.


Thanks,
Daniel
