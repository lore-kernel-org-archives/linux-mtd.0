Received: from mail-qa0-x231.google.com ([2607:f8b0:400d:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTEJ5-0007L3-1f
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 18:46:07 +0000
Received: by mail-qa0-f49.google.com with SMTP id w8so35024154qac.8
 for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2015 10:45:44 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
In-Reply-To: <1423520026-27068-1-git-send-email-namnguyen@chromium.org>
References: <1423520026-27068-1-git-send-email-namnguyen@chromium.org>
Date: Wed, 4 Mar 2015 10:45:44 -0800
Message-ID: <CAAK6Zt1YM+bBKwkEZ2nT5iWYaL0HOvfTWj_xAq+5fp4spcZJXA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd-utils: Add nandpart to add/delete partition
From: Daniel Ehrenberg <dehrenberg@chromium.org>
To: "Nam T. Nguyen" <namnguyen@chromium.org>
Content-Type: text/plain; charset=UTF-8
Cc: Mike Frysinger <vapier@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 9, 2015 at 2:13 PM, Nam T. Nguyen <namnguyen@chromium.org> wrote:
> Add a simple utility to exercise BLKPG ioctl.
>
> Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>

Suggestion: rename to flash_part.c . This utility is not
nand-specific, and flash_ is used for general MTD utilities.

Dan
