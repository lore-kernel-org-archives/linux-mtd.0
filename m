Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5cbO-0000CP-K6
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 11:33:19 +0000
Subject: Re: [PATCH resend] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: ext Viresh Kumar <viresh.kumar@st.com>
In-Reply-To: <1301653534-22223-1-git-send-email-viresh.kumar@st.com>
References: <1301653534-22223-1-git-send-email-viresh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 14:30:48 +0300
Message-ID: <1301657448.2789.44.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin Kumar <vipin.kumar@st.com>, David.Woodhouse@intel.com,
	amit.goel@st.com, armando.visconti@st.com, shiraz.hashim@st.com,
	linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 15:55 +0530, ext Viresh Kumar wrote:
> +		/*
> +		 * This is a temporary erase check. A newly erased page read
> +		 * would result in an ecc error because the oob data is also
> +		 * erased to FF and the calculated ecc for an FF data is not
> +		 * FF..FF.
> +		 * This is a workaround to skip performing correction in case
> +		 * data is FF..FF
> +		 */

Sorry, but still questions.

The comment says this is temporary - why? When and how this going to be
change to become "permanent".

And you still did not add words about the problem with bit-flips.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
