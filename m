Received: from mga01.intel.com ([192.55.52.88])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5ubS-0005uv-7Q
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 07:51:07 +0000
Message-ID: <1331279605.22872.23.camel@sauron.fi.intel.com>
Subject: Re: Updating UBIFS rootfilesystem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Fri, 09 Mar 2012 09:53:25 +0200
In-Reply-To: <Pine.LNX.4.64.1202241045220.1556@lnxricardw.se.axis.com>
References: <4F326E27.7020407@esd.eu>
 <1329141475.22240.151.camel@sauron.fi.intel.com> <4F4746E8.9040002@esd.eu>
 <Pine.LNX.4.64.1202241045220.1556@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthias Fuchs <matthias.fuchs@esd.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-02-24 at 10:47 +0100, Ricard Wanderlof wrote:
> I agree, it would be very nice to be able to rename a mounted file system, 
> although I don't know if there is something internal to UBI which would 
> conflict with that. For instance, when doing 'df', it reports the UBI 
> volume name (such as "ubi0:rootfs") and I don't know if it's possible to 
> change the corresponding string once the file system has been mounted.

Well, may be it is possible. It is a matter of someone experimenting
with this if he really needs it.

-- 
Best Regards,
Artem Bityutskiy
