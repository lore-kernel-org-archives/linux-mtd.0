Received: from p01c11o149.mxlogic.net ([208.65.144.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OFbvJ-0001wP-Ki
	for linux-mtd@lists.infradead.org; Fri, 21 May 2010 23:46:38 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Greg KH <greg@kroah.com>
Date: Fri, 21 May 2010 18:46:20 -0500
Subject: RE: [PATCH] pcm551.c: use pci_ids.h defines
Message-ID: <0D753D10438DA54287A00B0270842697636F3238BB@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697636F3238A0@AUSP01VMBX24.collaborationhost.net>
	<20100521234232.GA31672@kroah.com>
In-Reply-To: <20100521234232.GA31672@kroah.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jbarnes@virtuousgeek.org" <jbarnes@virtuousgeek.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, May 21, 2010 4:43 PM, Greg KH wrote:
> On Fri, May 21, 2010 at 06:24:01PM -0500, H Hartley Sweeten wrote:
>> Move the DEVICE id to pci_ids.h and then use the VENDOR/DEVICE ids provi=
ded
>> in pci_ids.h instead of creating local ids.
>
> Did you read the comment at the top of the pci_ids.h file saying not to
> do this?  Just use the vendor id that is already in the pci_ids.h file
> in the driver, but leave the device id in the driver itself.

Oops.. My bad, sorry.

Please ignore this patch (and the other two).

Regards,
Hartley=
