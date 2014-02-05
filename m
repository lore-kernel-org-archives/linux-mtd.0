Received: from plane.gmane.org ([80.91.229.3])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WB58L-00004t-Lx
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2014 16:15:30 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1WB57v-0003iz-U4
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2014 17:15:04 +0100
Received: from 216.52.207.103 ([216.52.207.103])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2014 17:15:03 +0100
Received: from coltontpeltier by 216.52.207.103 with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2014 17:15:03 +0100
To: linux-mtd@lists.infradead.org
From: Colton <coltontpeltier@gmail.com>
Subject: Re: nandsim LEB size mismatch
Date: Wed, 5 Feb 2014 16:10:24 +0000 (UTC)
Message-ID: <loom.20140205T165327-419@post.gmane.org>
References: <CALuNSF7ESa0CBE0+kNO_HDeWKVgzN8ZZo7TnNGadTC0AuZjEXQ@mail.gmail.com>
 <CALuNSF7A=PBpyP4=nEEKvuhAMAQJvucGddhHPuxSuqZuCTnmEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks a lot Simon, this really helped me out. To anyone else who's doing 
this, make sure that when you do the "ubimkvol" command you change 0xA00000 
to a big enough filesize for your ubifs volume. I just looked at my filesize 
and converted it to hex and used that.
