Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjUtd-0000Pi-OT
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 12:29:30 +0000
Received: by wgbds1 with SMTP id ds1so3530852wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 05:29:28 -0700 (PDT)
Date: Tue, 26 Jun 2012 15:29:23 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/8] mtd: nand: remove unused 'int' return codes
Message-ID: <20120626152923.5452ee5b@pixies.home.jungo.com>
In-Reply-To: <1340408145-24531-5-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-5-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 Jun 2012 16:35:41 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> The return codes for read_abs_bbts() and search_read_bbts() are always
> non-zero, and so don't have much meaning. Just remove them.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
