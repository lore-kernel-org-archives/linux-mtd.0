Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJopf-0005I5-Ad
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 19:12:35 +0000
Received: by mail-qa0-f53.google.com with SMTP id v10so5922867qac.40
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 12:12:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140816011633.GH18411@ld-irv-0074>
References: <1407998124-3166-1-git-send-email-computersforpeace@gmail.com>
 <CABkLOboi7YQhuDjLPeyyf5dDV1mQu02faTe9j8Y8ppH8Tzi+1g@mail.gmail.com>
 <20140816011633.GH18411@ld-irv-0074>
Date: Tue, 19 Aug 2014 12:12:11 -0700
Message-ID: <CAN8TOE9OzvfUNryo_yke159bCtBk+XgeRxbBHkJrRaxQxbgNCg@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: check return code for get_chip()
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 15, 2014 at 6:16 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Thanks! Queued to linux-mtd.git/master. It'll probably go in 3.16, as
> it's a fix for a new feature.

Just noticed my typo: this is of course for 3.17, not 3.16 :)

Brian
