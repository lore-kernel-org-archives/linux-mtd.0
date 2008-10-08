Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnSSO-00012a-RP
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 06:23:37 +0000
Received: by rv-out-0708.google.com with SMTP id b17so5537173rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Oct 2008 23:23:35 -0700 (PDT)
Message-ID: <8bd0f97a0810072323v316d0ad6w7168097a6fb9941f@mail.gmail.com>
Date: Wed, 8 Oct 2008 02:23:35 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Mitch Davis" <mjd-linux-mtd@afork.com>
Subject: Re: mtd-utils: fec.c uses bcopy()
In-Reply-To: <8956d4ca0810072306t64d28c8apa888ede8c7ccbc33@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8956d4ca0810071727i63554837k923a0091b3ef9bd0@mail.gmail.com>
	<8bd0f97a0810071802t52bc60fs6a230e30d7ed1c8f@mail.gmail.com>
	<8956d4ca0810071936p21240f4dn89e161c6ef07847c@mail.gmail.com>
	<8bd0f97a0810071938s3366f340redc61e87e6b020b8@mail.gmail.com>
	<8956d4ca0810072156w4fcdf1barb2d740e10d97c380@mail.gmail.com>
	<8bd0f97a0810072207h6848895fpea038316aa583fa6@mail.gmail.com>
	<8956d4ca0810072306t64d28c8apa888ede8c7ccbc33@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 8, 2008 at 02:06, Mitch Davis wrote:
> On Wed, Oct 8, 2008 at 4:07 PM, Mike Frysinger wrote:
>> On Wed, Oct 8, 2008 at 00:56, Mitch Davis wrote:
>>> On Wed, Oct 8, 2008 at 1:38 PM, Mike Frysinger wrote:
>>>> really you should use git to send the patch
>>>
>>> Do you mean a git push?
>>
>> no.  use the send-email function.  read `man git-send-email` for more info.
>
>  - This process of submitting stuff with git-send-email is not
> documented on the MTD page, but newbies should use it anyway.  Can I
> suggest the howto on the MTD page be updated to avoid people like me
> getting it wrong?
>  - On my machine (Fedora 9) git-send-email is part of the git-email
> package, not standard git.  Others may benefit from knowing this if
> it's part of that updated page.

it's the same method as any git repo.  there isnt anything specific
for the MTD project other than the e-mail address you send it to.  if
you want to know about git and how to use it, you should go to the git
homepage:
http://git.or.cz/

>  - I've sent my diff twice already.  Can you have a look at it and
> comment please? :-)

i have no commit access, but i already gave the patch a quick eye over
and it looked fine to me.  the b* suite of memory functions have long
been deprecated in favor of the mem* functions.
-mike
