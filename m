Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P4AXl-0001sY-4T
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 10:51:17 +0000
Received: by vws11 with SMTP id 11so347542vws.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Oct 2010 03:51:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4CAEEADF.5070103@mvista.com>
References: <1286451272-12988-1-git-send-email-savinay.dharmappa@ti.com>
	<4CADE1B8.50800@mvista.com>
	<B85A65D85D7EB246BE421B3FB0FBB59302342ADE9D@dbde02.ent.ti.com>
	<4CAEEADF.5070103@mvista.com>
Date: Fri, 8 Oct 2010 12:51:15 +0200
Message-ID: <AANLkTikzJc5QwSMBF8GzPbYRQaZ6Js-fEQHssphaWp0=@mail.gmail.com>
Subject: Re: [PATCH 2/2] davinci: Platform support for OMAP-L137/AM17x NOR
	flash driver
From: Vitaly Wool <vitalywool@gmail.com>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	Aleksey Makarov <amakarov@ru.mvista.com>, "Nori,
	Sekhar" <nsekhar@ti.com>, David Griego <dgriego@mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Dharmappa, Savinay" <savinay.dharmappa@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 8, 2010 at 11:56 AM, Sergei Shtylyov <sshtylyov@mvista.com> wro=
te:

> =A0 I think the code was more compact with the old error handling. And an=
yway,
> I'm not feeling happy when TI is changing MV's code.

Leaving the inter-vendor relations aside, I'd say, anyone can modify
any GPL code. The thing is, this person can not just inherit
Signed-off-by from the previous version, and this is what happened I
guess.

~Vitaly
