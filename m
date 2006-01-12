Received: from nproxy.gmail.com ([64.233.182.201])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ex60k-0005GN-Ge
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2006 17:13:19 +0000
Received: by nproxy.gmail.com with SMTP id k27so11406nfc
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jan 2006 09:11:44 -0800 (PST)
Message-ID: <6934efce0601120911u33294d1by1dcebac8555118c4@mail.gmail.com>
Date: Thu, 12 Jan 2006 09:11:44 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: James Hughes <JHughes@linx.co.uk>
In-Reply-To: <DB1B6B12D0E2F0469EB35A9586066B6ECE79A1@stivesemail.stives.linx.gbr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <DB1B6B12D0E2F0469EB35A9586066B6ECE79A1@stivesemail.stives.linx.gbr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I don't know - the driver itself is being registered, since the printk I
> have put in are outputting to the kernel boot console. I get no other
> messages from the MTD system AT ALL.
>
> I asked where I need to debug to find out what causes the probe to be cal=
led
> - i.e. the area of code that starts up the MTD system, as I don't know wh=
ere
> to start debugging

This seems more clear to me now.  You have a a sandgate map driver.=20
You know it is being executed because of the printk()s, but it does
not actually call the probing routines.

>(I'm not talking about the map driver itself, but the
> code that call the map driver).

I'm not sure I understand your reasoning here.  The map driver is
being called.  The probing routines should be called by the map driver
but are not.  You need to debug the map driver at this point.

> There's no point in debugging in the probe
> function as I know that isn't being called.

Exactly.

> I created a file in the maps directory, which is a copy of the mainstone =
map
> (mainstone-flash.c)with alteration to match the sandgate2 flash map. I
> stated this in my previous message. This contains the module which is
> registered, but doesn't appear to be probed. There may be a problem with =
me
> misunderstanding what you mean map file - do you mean my Sandgate equival=
ent
> of mainstone-flash.c or is there a different map file I need to be sortin=
g
> out?

Yes, I mean the sandgate equivalent of mainstone-flash.c.

> If it isn't being called (i.e. the probe section) how do I ensure that it
> *is* called????

Fix the map driver.

> I hope I have answered you questions satisfactorily this time.

Sorry about the unfriendly tone of the previous email.  It did not
read as I had intended.   I started and stopped that email several
times, apparently each time I restarted I added a new dig about not
answering question, oops :)
