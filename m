Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xzava-0006xO-OS
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 00:51:23 +0000
Received: by mail-ig0-f176.google.com with SMTP id l13so2566187iga.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 16:51:01 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
In-Reply-To: <1417525136-25731-2-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-2-git-send-email-ezequiel.garcia@imgtec.com>
Date: Fri, 12 Dec 2014 16:51:01 -0800
Message-ID: <CAAK6Zt3v5pebUbftcwAsf_aWao0B-ZfiU06nv5GLtatMQxNafg@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: nand: Check length of ID before reading bits per
 cell
From: Daniel Ehrenberg <dehrenberg@chromium.org>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Cc: bpqw@micron.com, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 frankliu@micron.com, Andrew Bresticker <abrestic@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 arnaud.mouiche@invoxia.com, Brian Norris <computersforpeace@gmail.com>,
 James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 2, 2014 at 4:58 AM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
> The table-based NAND identification currently reads the number
> of bits per cell from the 3rd byte of the extended ID. This is done
> for the so-called 'full ID' devices; i.e. devices that have a known
> length ID.
>
> However, if the ID length is shorter than three, there's no 3rd byte,
> and so it's wrong to read the bits per cell from there. Fix this by
> adding a check for the ID length.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

Reviewed-by: Dan Ehrenberg <dehrenberg@chromium.org>
