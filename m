Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdmRE-0004Pu-7F
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 07:01:10 -0400
Received: by ug-out-1314.google.com with SMTP id y2so2218192uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 May 2006 04:00:57 -0700 (PDT)
Message-ID: <625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
Date: Wed, 10 May 2006 06:00:57 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Vitaly Wool" <vwool@ru.mvista.com>
In-Reply-To: <4461B7CD.9010100@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4461B7CD.9010100@ru.mvista.com>
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/10/06, Vitaly Wool <vwool@ru.mvista.com> wrote:

> As a filesystem is read-only, wear-out can't occur during the normal
> use, only on root filesystem upgrade. Therefore writing it using a tool
> like nandwrite that bypasses bad blocks seems to be enough, and the only
> thing needed is either an in-MTD layer that makes a partition look as if
> there's no babd blocks, or  similar means within a filesystem.

Not quite the case.  You need bad block skipping, yes.  But NAND can
get bit flips in good blocks still.  How do you deal with that?  You
can't leave the block in that state forever because it will continue
to get bit flips and then your data will be unusable.

josh
