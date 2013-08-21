Received: from mail-ve0-f169.google.com ([209.85.128.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBy72-0005Hc-1x
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 02:25:32 +0000
Received: by mail-ve0-f169.google.com with SMTP id db10so995489veb.28
 for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2013 19:25:08 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 20 Aug 2013 19:25:06 -0700
Message-ID: <CAN8TOE_8f_vhCAhRaBGXk9=F8=-2YtY5eSNgypSuxiL5z-B-=Q@mail.gmail.com>
Subject: [Device-tree] mailing list responsiveness and discoverability
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ian.campbell@citrix.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: devicetree@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello device tree maintainers,

I (sub)maintain the Linux MTD subsystem and hang out on the
linux-mtd@infradead.org mailing list. I have been seeing an increasing
number of submissions that involve device-tree changes. Many of these
changes are ill thought out and may even cause ABI breakage.

According to discussions I've seen on LKML, you want to see better
bindings merged into the kernel, and you want to maintain more control
over the acceptance of bindings in general. However, I see a few
problems that have inhibited this.

(1) Mailing list change: it just so happens that you recently moved
your mailing list to @vger.kernel.org. Some people are still CC'ing
the old one (if they CC any DT list at all). I'm not sure what can be
done about this, exactly. Perhaps a forwarding rule + a warning
response would have been better for a transition period, rather than
just shutting down and rejecting from the old one.

(2) Responsiveness: when we finally do CC devicetree@vger.kernel.org,
I don't see much feedback, even for those which (when I get around to
reviewing them myself) look like they have obvious issues that
device-tree maintainers should care about.

(3) Archives: Archives for devicetree@vger.kernel.org are not easy to
find. I recently subscribed to the mailing list, so general
device-tree activity doesn't get lost in oblivion (to me). But if no
one has done so yet, I'd like to see this mailing list archived on at
least one of gmane (gmane has the old devicetree list and not the new
one.), marc.info (I "devicetree" is this the new one?), etc. and
linked at:

http://vger.kernel.org/vger-lists.html#devicetree

(there are no listed archives as of this email)

Admittedly, (2) is exacerbated by (1) when submitters send to the
wrong address and don't bother correcting and resending, so maybe
discoverability ((1) and (3)) is the only real issue.

Thanks for considering my complaints.

Regards,
Brian
