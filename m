Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtHCF-0000De-Ar
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 15:38:59 +0000
Message-ID: <1446478715.6126.109.camel@gmail.com>
Subject: Re: [PATCH 05/11] ubifs: remove ununsed ubifs context from key helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: david@sigma-star.at
Date: Mon, 02 Nov 2015 17:38:35 +0200
In-Reply-To: <5636BC3D.5000200@cn.fujitsu.com>
References: <1446290160-30696-1-git-send-email-richard@nod.at>
 <1446290160-30696-6-git-send-email-richard@nod.at>
 <5636BC3D.5000200@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-11-02 at 09:28 +0800, Dongsheng Yang wrote:
> Yes, all ubifs_info *c in key.h are not used, But I am
> not sure about is that intentional or not.

Hi,

the intention was that there would be multiple key formats supported,
and these functions would look at something like c->key_format to
figure out how to work with this key.

Right now there is only one key type, so these are not needed as of
today.

Artem.
