Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnOwv-0001aO-Vc
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 02:38:54 +0000
Received: by rv-out-0708.google.com with SMTP id b17so5447833rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Oct 2008 19:38:52 -0700 (PDT)
Message-ID: <8bd0f97a0810071938s3366f340redc61e87e6b020b8@mail.gmail.com>
Date: Tue, 7 Oct 2008 22:38:52 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Mitch Davis" <mjd-linux-mtd@afork.com>
Subject: Re: mtd-utils: fec.c uses bcopy()
In-Reply-To: <8956d4ca0810071936p21240f4dn89e161c6ef07847c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8956d4ca0810071727i63554837k923a0091b3ef9bd0@mail.gmail.com>
	<8bd0f97a0810071802t52bc60fs6a230e30d7ed1c8f@mail.gmail.com>
	<8956d4ca0810071936p21240f4dn89e161c6ef07847c@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 7, 2008 at 22:36, Mitch Davis wrote:
> On Wed, Oct 8, 2008 at 12:02 PM, Mike Frysinger wrote:
>> On Tue, Oct 7, 2008 at 20:27, Mitch Davis wrote:
>>> fec.c in mtd-utils uses bcopy(), so mtd-utils doesn't compile for me.
>>> I'd like to fix this.
>>>
>>>  - Should I rewrite fec.c so it uses memcpy instead?
>>>  - Should I just add #define NEED_BCOPY to fec.c?
>>>  - Should I leave fec.c unchanged and add -DNEED_BCOPY to the Makefile
>>> (which would be passed to every compile?)
>>
>> a simple sed can fix the code as the only difference between bcopy()
>> and memcpy() is the argument order.  ifdef's are pointless/ugly in
>> this case.
>
> I agree.  I've attached a diff that makes this change.
>
> It compiles with no warnings, but I have no way of testing it.  Any
> suggestions what to do next?

use `git diff` to generate a diff instead of posting the entire file
as an attachment.  really you should use git to send the patch, but if
that's too much for you, just post the diff.
-mike
