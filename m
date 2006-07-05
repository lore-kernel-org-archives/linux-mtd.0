Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy5qt-0007L9-3E
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 07:47:42 -0400
Subject: Re: [PATCH 1/1] UBI
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0607050436r591a1857m348c8f64cc16e0b1@mail.gmail.com>
References: <1151408975.16490.12.camel@sauron.oktetlabs.ru>
	<625fc13d0607050436r591a1857m348c8f64cc16e0b1@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 05 Jul 2006 15:46:57 +0400
Message-Id: <1152100017.4825.20.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Josh,

On Wed, 2006-07-05 at 06:36 -0500, Josh Boyer wrote:
> Does the range for bad eraseblock reserve really need to be up to 1/2
> the device?
Probably no, which digit would you conceive?

> Perhaps all the MTD_UBI_DEBUG options could be hidden in a seperate
> Kconfig file that is sourced.  As it stands now, it's fairly bloated
> for a large majority of options that won't get enabled.
Well, may be. I am not confused by them, actually, but I have nothing
against moving them to a separate file - why not?

> Why all the forward declarations of structures in the various header
> files?  Couldn't this be done by properly including the header files
> that are needed?
Well, I deliberately used forward declaration as it is faster then
including headers just for the sake of getting some structure defined.

Why is it bad? Please, refer a particular example.

> This is a short list at the moment.  I need to find some more time to
> dig into the patch.
It would be hunky dory :-)

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
