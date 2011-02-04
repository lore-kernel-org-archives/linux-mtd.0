MIME-Version: 1.0
Sender: linus.ml.walleij@gmail.com
In-Reply-To: <cover.1296818921.git.segoon@openwall.com>
References: <cover.1296818921.git.segoon@openwall.com>
Date: Fri, 4 Feb 2011 14:11:36 +0100
Message-ID: <AANLkTik9FkP==O7athEugN4gLrnh7qyg_pPRR3MZ0La7@mail.gmail.com>
Subject: Re: [rtc-linux] [PATCH 00/20] world-writable files in sysfs and
	debugfs
From: Linus Walleij <linus.walleij@stericsson.com>
To: rtc-linux@googlegroups.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Christie <michaelc@cs.wisc.edu>,
	Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
	Tony Lindgren <tony@atomide.com>, platform-driver-x86@vger.kernel.org,
	socketcan-core@lists.berlios.de, Corentin Chary <corentincj@iksaif.net>,
	"James E.J. Bottomley" <James.Bottomley@suse.de>,
	Julia Lawall <julia@diku.dk>, Russell King <linux@arm.linux.org.uk>,
	Samuel Ortiz <sameo@linux.intel.com>, linux-scsi@vger.kernel.org,
	Karol Kozimor <sziwan@users.sourceforge.net>,
	Kevin Hilman <khilman@deeprootsystems.com>,
	Luca Risolia <luca.risolia@studio.unibo.it>, open-iscsi@googlegroups.com,
	Wolfgang Grandegger <wg@grandegger.com>, Matthew Garrett <mjg@redhat.com>,
	acpi4asus-user@lists.sourceforge.net,
	Carlos Corbacho <carlos@strangeworlds.co.uk>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Alessandro Zummo <a.zummo@towertech.it>, security@kernel.org,
	Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/2/4 Vasiliy Kulikov <segoon@openwall.com>:

> The search was made with trivial shell commands:
>
> find | xargs grep S_IWUGO
> find | xargs grep S_IWOTH

We only use our debugfs entries as root so it shouldn't matter much, this
is way better, thanks for fixing.

> =A0mach-ux500: mbox-db5500: world-writable sysfs fifo file
> =A0mfd: ab3100: world-writable debugfs *_priv files
> =A0mfd: ab3500: world-writable debugfs register-* files
> =A0mfd: ab8500: world-writable debugfs register-* files

Acked-by: Linus Walleij <linus.walleij@stericsson.com>

For these.

Yours,
Linus Walleij
