Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD8Pj-0004nd-7P
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 07:05:24 +0000
Message-ID: <1362553561.21850.2.camel@sauron>
Subject: Re: Diskonchip regression
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 06 Mar 2013 09:06:01 +0200
In-Reply-To: <5136BAD5.1030109@newsguy.com>
References: <1362389632.763807690@f177.mail.ru>
 <1362496578.21850.1.camel@sauron> <5136BAD5.1030109@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 19:41 -0800, Mike Dunn wrote:
> On 03/05/2013 07:16 AM, Artem Bityutskiy wrote:
> > On Mon, 2013-03-04 at 13:33 +0400, Alexander Shiyan wrote:
> >> Hello All.
> >>
> >> I want to inform about diskonchip regression.
> >> Mounting diskonchip partition now failed due "mtd: nand: kill NAND_NO_READRDY" commit.
> > 
> > Which diskonchip is that? I was thinking about submitting an RFC about
> > killing all diskonchip stuff except of doc3g and docg4.
> > 
> 
> I was surprised to learn of a user of the legacy diskonchips out there.

Yeah. Let's keep this stuff fore few more years then.

-- 
Best Regards,
Artem Bityutskiy
