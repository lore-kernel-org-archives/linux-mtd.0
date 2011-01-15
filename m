Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pe3gZ-0000RL-QQ
	for linux-mtd@lists.infradead.org; Sat, 15 Jan 2011 10:48:45 +0000
Received: by fxm19 with SMTP id 19so3683978fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 15 Jan 2011 02:48:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
References: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
Date: Sat, 15 Jan 2011 10:48:40 +0000
Message-ID: <AANLkTikhFt32NA9Lhzh0LDCzQmem3tjJZTG1TnP6ugnK@mail.gmail.com>
Subject: Re: validate_sb: bad superblock, error 8 (Minimum UBI volume size for
	UBIFS image)
From: Andrew Murray <amurray@mpcdata.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 January 2011 09:47, Andrew Murray <amurray@mpcdata.com> wrote:
>
> Is there a way to determine the minimum UBI volume size which will
> support a given UBIFS filesystem image?
>

My conclusion is this (with my version of kernel and mkfs.ubifs tool):

(Min No. UBI Volume LEBS) = (jrn_lebs) + 3 + (log lebs) + (lpt_lebs) +
(orph_lebs)

And these values can all be determined (or specified) by the
mkfs.ubifs tool by using the verbose -v flag.

This seems to hold true - Does this seem reasonable?

Thanks,

Andrew Murray
