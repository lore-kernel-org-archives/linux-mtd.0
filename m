Received: from smtp-vbr9.xs4all.nl ([194.109.24.29])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N6ONo-0000LE-Ps
	for linux-mtd@lists.infradead.org; Fri, 06 Nov 2009 12:57:45 +0000
Message-ID: <4AF41D40.3050907@aimvalley.nl>
Date: Fri, 06 Nov 2009 13:57:36 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: Re: can UBIFS be NFS exported
References: <4AF2DE80.5010808@aimvalley.nl>
	<3C2FAC88009448298C46A613D8C066FE@sisodomain.com>
In-Reply-To: <3C2FAC88009448298C46A613D8C066FE@sisodomain.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tadimarri Sarath Babu wrote:
> ----- Original Message ----- 
> From: "Norbert van Bolhuis" <nvbolhuis@aimvalley.nl>
> To: <linux-mtd@lists.infradead.org>
> Sent: Thursday, November 05, 2009 7:47 PM
> Subject: can UBIFS be NFS exported
> 
> 
>> just to make sure. UBIFS can not be NFS exported, is this correct ?
>    Can you clarify on this ? I am able to use NFS as rootfs and mount ubifs over the OneNAND .
>> (I need NFS in our distributed system. The server uses UBIFS.
>>  But there is a ISO9660 image on our UBIFS and fortunately
>>  ISO(Z)FS can be NFS exported, so it's not a problem)
>>

I'm talking about the kernel nfsd ability to export UBIFS.
This would allow remote systems to NFS mount a UBIFS directory.

for this UBIFS should implement what's described in
Documentation/filesystems/Exporting. I don't see it for UBIFS.

For JFFS2 for example I see a jffs2_export_ops in fs/jffs2/super.c.

A user-space NFS server (e.g. unfs3) could probably export UBIFS.

In your case I think you're not exporting UBIFS but just use NFS for
your rootfs.
