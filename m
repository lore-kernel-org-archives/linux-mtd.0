Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5USw-0003DN-BA
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 09:51:31 +0000
Received: by mail-wm0-x243.google.com with SMTP id y10so2926316wmh.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 02:51:09 -0700 (PDT)
MIME-Version: 1.0
From: chrysophoron kit <chrysophoronkit@gmail.com>
Date: Tue, 2 May 2017 11:51:07 +0200
Message-ID: <CAJo3e9cU50D7GDBYSCYRVYo+RrwvP+JvAZh9qQ=bcFgKjeYu7Q@mail.gmail.com>
Subject: [MTD] how to retrieve all patches related MTD bitflip_threshold from
 one old version to new one
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello every MTD export

who knows how to retrieve all patches related MTD be applied from one
old version kernel
to new one? for example, we are now using 2.6.39, but we don't want to
update kernel
vertion to v4.x, we only want to update and install all MTD patches
related MTD bitflip_threshold.
becase we now continue using our old drivers based on 2.6.39, but
found one issue is related to
ECC bitflip_threshold, which 2.6.39 doesn't involve it. It is
impossible now to let company update
kernel version.
who can tell me how to retrieve all patches related bitflip_threshold,
and doesn't update kernel verson.
Thanks very much in advance.
