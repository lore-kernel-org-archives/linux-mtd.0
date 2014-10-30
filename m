Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xjioj-0007OF-6Q
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 06:02:42 +0000
Received: by mail-wg0-f54.google.com with SMTP id m15so3449393wgh.27
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 23:02:19 -0700 (PDT)
In-Reply-To: <20141030014704.GE23619@ld-irv-0074>
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <1414420445-9020-1-git-send-email-frans.klaver@xsens.com>
 <544F6611.1000801@ti.com> <20141030014704.GE23619@ld-irv-0074>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: [PATCH v2] mtd: omap: fix mtd devices not showing up
From: Frans Klaver <fransklaver@gmail.com>
Date: Thu, 30 Oct 2014 07:02:11 +0100
To: Brian Norris <computersforpeace@gmail.com>,Roger Quadros <rogerq@ti.com>
Message-ID: <D7E4DB5C-45E3-44BE-AD26-41042FD0AAD6@gmail.com>
Cc: Frans Klaver <frans.klaver@xsens.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 October 2014 02:47:04 CET, Brian Norris <computersforpeace@gmail.com> wrote:
>On Tue, Oct 28, 2014 at 11:46:57AM +0200, Roger Quadros wrote:
>> On 10/27/2014 04:34 PM, Frans Klaver wrote:
>> > Since commit 6d178ef2fd5e ("mtd: nand: Move ELM driver and rename
>as
>> > omap_elm"), I don't have any mtd devices present on my am335x. This
>> > changes the link order of the omap_elm and omap2 objects, causing
>them
>> > to probe in the wrong order.
>> > 
>> > To fix this, make elm_config defer probing until the omap_elm
>driver is
>> > actually loaded.
>> > 
>> > Signed-off-by: Frans Klaver <frans.klaver@xsens.com>
>> 
>> Acked-by: Roger Quadros <rogerq@ti.com>
>
>Pushed to l2-mtd.git/for-3.18. Thanks!

Thanks 

>While this might be considered a link-order bug from long ago, it's not
>actually important until 3.18-rc1 where we changed the link order,
>right? So it doesn't need to go to -stable?

Correct. 

Thanks, 
Frans 
