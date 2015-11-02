Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtHoh-00088j-Vr
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 16:18:45 +0000
Subject: Re: MTD mounting problem
To: "Krug, Markus" <Markus.Krug@bruker.com>
References: <9B6BBBFFF27FBB469F5F9ECB4655AFDA40FBF7@bruexc005.brumgt.local>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56378CC8.2030100@nod.at>
Date: Mon, 2 Nov 2015 17:18:16 +0100
MIME-Version: 1.0
In-Reply-To: <9B6BBBFFF27FBB469F5F9ECB4655AFDA40FBF7@bruexc005.brumgt.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.11.2015 um 16:55 schrieb Krug, Markus:
> Thanks Richard,
> The problem was the minor number of the block device, which differs from the minor number of the char device.
> With
> mknod /dev/mtd5 c 31 10
> mknod /dev/mtdblock5 b 90 5
> I was able to mount the device.

:-)

> However I still don't know, why the devices are not created in /dev at start up. 

Well, how is your /dev mount managed?

Thanks,
//richard
