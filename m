Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIYpR-0003bv-Kf
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 07:22:54 +0000
Received: by mail-ig0-f177.google.com with SMTP id h3so792779igd.4
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2014 23:22:32 -0800 (PST)
Date: Tue, 25 Feb 2014 23:21:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maximintegrated.com>
Subject: Re: [Q] `ubiattach: ioctl 0x40186f40 failed: Inappropriate ioctl for
 device' - What changed?
Message-ID: <20140226072141.GA13420@norris-Latitude-E6410>
References: <4790760.yeQTJBGPZK@laclwks004>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4790760.yeQTJBGPZK@laclwks004>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, Feb 25, 2014 at 05:01:18PM +0100, Brian Foster wrote:
>  Using an (admittedly ancient) BuildRoot v2010.11
>  (which uses v2.6.36.4 kernel headers) with an
>  (also admittedly ancient) v2.6.36.4 Linux kernel,
>  ubiattach(1) works fine.  The ‘ubiattach’ is of
>  vintage v1.4.6 (and has not been modified).
> 
>  However, using that _identical_ ‘ubiattach’ binary
>  (which is for an ARM926EJ-S CPU) with a more recent
>  v3.10.30 kernel, it fails.  For example:
> 
>     # ubiattach -m7 -d0 /dev/ubi_ctrl
>     ubiattach: ioctl 0x40186f40 failed: Inappropriate ioctl for device
>     #

I'm honestly not sure where the above print came from. I'm checking out
ubiattach.c in mtd-utils v1.4.6, and I don't see this print. But
perhaps I'm just missing it...

>  I assume the value of, and/or parameter to, some
>  ioctl command has changed v2.6.36 → v3.10, but
>  am at a loss as to just _what_ changed (or why).

The parameter *shouldn't* have changed. We try to keep ABI
compatibility, as Linus sometimes loudly proclaims. And I don't think
I've seen any changes to ioctl(UBI_IOCATT). In fact, the reported ioctl
number (0x40186f40) still matches my functioning mtd-utils + 3.8.x
kernel.

>  Any pointers would be appreciated.

Well, here's a wild guess; it looks like struct ubi_attach_req is the
only UBI ioctl struct that does not have the __attribute__((packed))
annotation. So it's possible that your compiler didn't pack the struct
the same for your 3.10 kernel. Perhaps the following patch would help?

Brian

diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 723c324590c1..9dd7f31a2527 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -268,7 +268,7 @@ struct ubi_attach_req {
 	__s32 vid_hdr_offset;
 	__s16 max_beb_per1024;
 	__s8 padding[10];
-};
+} __packed;
 
 /**
  * struct ubi_mkvol_req - volume description data structure used in
