Received: from na3sys009aog121.obsmtp.com ([74.125.149.145])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIczG-00047S-Qt
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 09:07:59 +0000
Received: by mail-qw0-f51.google.com with SMTP id 25so237248qao.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2011 02:07:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1319528005.14178.2.camel@golum>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
	<1319127627.20953.8.camel@sauron>
	<CA+Xn3W3huOu_zu7MzSr0W1wpo7mD_ek8eOYNstkMnb9wm3-JZw@mail.gmail.com>
	<1319528005.14178.2.camel@golum>
Date: Tue, 25 Oct 2011 11:07:55 +0200
Message-ID: <CA+Xn3W3cavvbo1bcRMa5Dj=isAKXPFNeUE00h3E1yM6v6HFWvw@mail.gmail.com>
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
From: "Fache, Herve" <h-fache@ti.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: joern@lazybastard.org, joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Tue, Oct 25, 2011 at 09:32, Artem Bityutskiy <dedekind1@gmail.com> wrote=
:
> Did you test this for the case when it is compiled into the kernel as
> well, not only as kernel module?

Yes indeed, both cases have been tested.

Herv=C3=A9
--
Texas Instruments France SA, 821 Avenue Jack Kilby, 06270 Villeneuve
Loubet. 036 420 040 R.C.S Antibes. Capital de EUR 753.920
