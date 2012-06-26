Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjV3f-0001ew-BA
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 12:39:52 +0000
Received: by bkwj4 with SMTP id j4so4529639bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 05:39:48 -0700 (PDT)
Date: Tue, 26 Jun 2012 15:39:44 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 5/8] mtd: nand: rename '_raw' BBT scan functions
Message-ID: <20120626153944.45c0aee0@pixies.home.jungo.com>
In-Reply-To: <1340408145-24531-6-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-6-git-send-email-computersforpeace@gmail.com>
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

Hi Brian,

On Fri, 22 Jun 2012 16:35:42 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> None of these scanning functions use MTD_OPS_RAW mode any more, so there's
> really nothing 'raw' about them. Rename them to (hopefully) make the code
> a little clearer.

Minor nitpick: I guess this patch should be the last in your patchset.

This is since 'scan_read_raw_oob()' (renamed to 'scan_read_oob' by this
patch) still uses MTD_OPS_RAW; hence the statement "None of these
scanning functions use MTD_OPS_RAW mode any more" is incorrect at the
time this patch is introduced.

Regards,
Shmulik
