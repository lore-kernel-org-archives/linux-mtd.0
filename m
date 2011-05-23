Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOe2m-000366-21
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 22:56:12 +0000
Received: by fxm14 with SMTP id 14so5600004fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 15:56:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306142623-24952-3-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
	<1306142623-24952-3-git-send-email-jamie@jamieiles.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 23 May 2011 18:55:49 -0400
Message-ID: <BANLkTinmtYksAsCzO8ApGx7k9WNG659zYA@mail.gmail.com>
Subject: Re: [PATCH 02/62] mtd: introduce mtd_device_(un)register()
To: Jamie Iles <jamie@jamieiles.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 23, 2011 at 05:22, Jamie Iles wrote:
> To prepare for the removal of add_mtd_device and add_mtd_partitions(),
> introduce mtd_device_register(). =C2=A0This will create partitions if the=
y
> are supplied or register the whole device if there are no partitions.
>
> Once all drivers are converted to use mtd_device_register(),
> add_mtd_device() and add_mtd_partitions() will be made internal only.

i vaguely recall attempting to submit new functions like this a while
ago, but ultimately it was rejected due to the different behavior mtd
drivers had wrt partitions and whole devices
-mike
