Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD5iy-00036W-O2
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 06:54:25 +0000
Received: by lbcpe5 with SMTP id pe5so69143712lbc.2
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 23:54:01 -0700 (PDT)
From: Paul Fertser <fercerpav@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: openwrt-devel@lists.openwrt.org, linux-mtd@lists.infradead.org
Subject: Re: Rebooting boards with > 16M SPI flash
References: <201507081206.t68C6rUZ005399@home.paul.comp>
 <559E0C3D.6090008@openwrt.org>
Date: Thu, 09 Jul 2015 09:53:55 +0300
In-Reply-To: <559E0C3D.6090008@openwrt.org> (John Crispin's message of "Thu,
 09 Jul 2015 07:53:01 +0200")
Message-ID: <87fv4xzurg.fsf@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

John Crispin <blogic@openwrt.org> writes:
> looks good to me but i will run this past linux-mtd and ask them for an
> opinion before merging it.

This patch was meant as a quick "hack" rather than a complete solution,
that's why I didn't bother adding proper commit message, S-o-b etc. But
since I'm the author, I can do that promptly, whenever that's needed.

The main limitation is that I checked only a single datasheet (likely
Winbond) so other models might require different treatment. Another is
that such a patch is mostly a bad substitute for proper hardware design.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
