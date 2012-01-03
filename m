Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ri8yZ-0000Ma-Od
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 18:20:44 +0000
Received: by ghrr15 with SMTP id r15so7392562ghr.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jan 2012 10:20:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: 
Date: Tue,  3 Jan 2012 16:20:17 -0200
Message-Id: <1325614817-30774-1-git-send-email-festevam@gmail.com>
Cc: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  Composing:
    --from                  <str>  * Email From:
    --[no-]to               <str>  * Email To:
    --[no-]cc               <str>  * Email Cc:
    --[no-]bcc              <str>  * Email Bcc:
    --subject               <str>  * Email "Subject:"
    --in-reply-to           <str>  * Email "In-Reply-To:"
    --annotate                     * Review each patch that will be sent in an editor.
    --compose                      * Open an editor for introduction.

  Sending:
    --envelope-sender       <str>  * Email envelope sender.
    --smtp-server       <str:int>  * Outgoing SMTP server to use. The port
                                     is optional. Default 'localhost'.
    --smtp-server-port      <int>  * Outgoing SMTP server port.
    --smtp-user             <str>  * Username for SMTP-AUTH.
    --smtp-pass             <str>  * Password for SMTP-AUTH; not necessary.
    --smtp-encryption       <str>  * tls or ssl; anything else disables.
    --smtp-ssl                     * Deprecated. Use '--smtp-encryption ssl'.
    --smtp-domain           <str>  * The domain name sent to HELO/EHLO handshake
    --smtp-debug            <0|1>  * Disable, enable Net::SMTP debug.

  Automating:
    --identity              <str>  * Use the sendemail.<id> options.
    --cc-cmd                <str>  * Email Cc: via `<str> $patch_path`
    --suppress-cc           <str>  * author, self, sob, cc, cccmd, body, bodycc, all.
    --[no-]signed-off-by-cc        * Send to Signed-off-by: addresses. Default on.
    --[no-]suppress-from           * Send to self. Default off.
    --[no-]chain-reply-to          * Chain In-Reply-To: fields. Default off.
    --[no-]thread                  * Use In-Reply-To: field. Default on.

  Administering:
    --confirm               <str>  * Confirm recipients before sending;
                                     auto, cc, compose, always, or never.
    --quiet                        * Output one line of info per email.
    --dry-run                      * Don't actually send the emails.
    --[no-]validate                * Perform patch sanity checks. Default on.
    --[no-]format-patch            * understand any non optional arguments as
                                     `git format-patch` ones.
