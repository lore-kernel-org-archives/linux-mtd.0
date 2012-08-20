Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3RSq-0005HP-Ix
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 12:52:17 +0000
Received: by wibhn17 with SMTP id hn17so2784564wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 05:52:15 -0700 (PDT)
Date: Mon, 20 Aug 2012 15:52:10 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH v2 3/7] UBI: accept empty string for vid_hdr_offs parameter
Message-ID: <20120820155210.64d64803@pixies.home.jungo.com>
In-Reply-To: <1345464561-24464-4-git-send-email-richard.genoud@gmail.com>
References: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
 <1345464561-24464-4-git-send-email-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Mon, 20 Aug 2012 14:09:17 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
> @@ -1292,7 +1292,11 @@ static int __init bytes_str_to_int(const char *str)
>  	unsigned long result;
>  
>  	result = simple_strtoul(str, &endp, 0);
> -	if (str == endp || result >= INT_MAX) {
> +	if (str == endp)
> +		/* empty string, assume it's 0 */
> +		return 0;

This will allow "ubi=2,#" (or any non numeric character after the
comma), setting a zero vid_hdr_offs instead of erroring.

How about adding:

+	if (!*str)
+		/* empty string, assume it's 0 */
+		return 0;

Before the original (keep it):

 	result = simple_strtoul(str, &endp, 0);
	if (str == endp || result >= INT_MAX) {

Can you test this works in all cases?

Regards,
Shmulik
