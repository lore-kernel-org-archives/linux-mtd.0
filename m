Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9WQ5-0002xG-2p
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2015 11:08:26 +0000
Received: by mail-wm0-x235.google.com with SMTP id p187so18050166wmp.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Dec 2015 03:08:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2e8aa700cf3c4078a5d735dad29d1b1a@ServerDC.bittailors.com>
References: <2e8aa700cf3c4078a5d735dad29d1b1a@ServerDC.bittailors.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 17 Dec 2015 12:07:23 +0100
Message-ID: <CAOMqctR=GGkb1bG3BXQQBn+5fF129-guGYOUDARDoNs2djJOWw@mail.gmail.com>
Subject: Re: UBI/UBIFS: md5sum of files go bad while running (no powercut)
To: Ralph Erdmann <rerdmann@bittailors.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 17 December 2015 at 11:03, Ralph Erdmann <rerdmann@bittailors.com> wrote:
> Dear all,
> we encounter the following problem on some of our embedded boards in the field:
> Some files "go bad" during runtime, which causes our application to crash.
> A reboot "heals" this error.

Is it possible that these libraries being used all the time by the
application get cached in memory, get never evicted, and only the
cached in-memory copy is bitrotten?

Thanks

Michal
