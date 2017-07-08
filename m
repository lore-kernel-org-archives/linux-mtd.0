Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTeqU-0000lp-8n
 for linux-mtd@lists.infradead.org; Sat, 08 Jul 2017 01:47:43 +0000
Received: by mail-pg0-x235.google.com with SMTP id u62so24606603pgb.3
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 18:47:18 -0700 (PDT)
Date: Fri, 7 Jul 2017 18:47:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Martin Habets <mhabets@solarflare.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtdcore: Infrastructure for the device release API
Message-ID: <20170708014714.GG55942@google.com>
References: <20170518092248.23934.15034.stgit@mh-desktop.uk.solarflarecom.com>
 <20170527001323.GF114788@google.com>
 <7b7511f7-4380-fd3e-703e-8e50a3fcc265@solarflare.com>
 <1f68fe2b-b546-9c9f-03ee-2b90ba382038@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f68fe2b-b546-9c9f-03ee-2b90ba382038@solarflare.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 22, 2017 at 02:54:07PM +0100, Martin Habets wrote:
> Brian, any opinion about this?

I'm sure this is all awesome, but I haven't seen a patch that utilizes
this. It's save me some mental energy of trying to figure out what all
is supposed to be happening here if I had one.

Or this can wait until I've spent more time trying to figure out what
you're trying to do with this. And I haven't proven myself to spend a
lot of time looking at your patches so far ;)

Brian
