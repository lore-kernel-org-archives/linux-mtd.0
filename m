Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YShJR-0004mL-Fr
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 07:32:17 +0000
Message-ID: <1425367912.26652.47.camel@sauron.fi.intel.com>
Subject: Re: "corrupt empty space" error on boot?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Steve deRosier <derosier@gmail.com>
Date: Tue, 03 Mar 2015 09:31:52 +0200
In-Reply-To: <CALupW3CugdN+cwMZzePAhZSHbGhd9gfjk==DH=7Ezu54Y1BXUA@mail.gmail.com>
References: <CALupW3CugdN+cwMZzePAhZSHbGhd9gfjk==DH=7Ezu54Y1BXUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-03-02 at 08:39 -0800, Steve deRosier wrote:
> Logically, it seems to me that a non ecc protected bit-flip in an
> empty page should be a non-issue. UBI should be able to move the
> block, erase the block, torture/return-to-service and move on with
> it's life.  No data is destroyed or even affected.

Yes, you are right, if there is a corruption, UBIFS can:

1. Try to understand if this is a corruption in empty space or not.
2. If yes, recover the LEB.

But this is not implemented. People keep hitting this issue, but no one
contributed fixes yet.

> A unit not mounting the rootfs because of a bit-flip in _empty_space_
> is unacceptable to us, so I've got to figure out a way to deal with
> this rare event.

Well, improving UBIFS would be one of the possible solutions.

Artem.
